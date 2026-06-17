from datetime import datetime

from airflow import DAG
from airflow.operators.bash import BashOperator


DBT_PROJECT_DIR = "/usr/local/airflow/include/dbt/tpch_analytics"
DBT_PROFILES_DIR = "/usr/local/airflow/include/.dbt"


with DAG(
    dag_id="snowflake_dbt_elt_pipeline",
    start_date=datetime(2026, 1, 1),
    schedule="@daily",
    catchup=False,
    tags=["snowflake", "dbt", "elt"],
) as dag:

    dbt_build = BashOperator(
        task_id="run_dbt_build",
        bash_command=(
            f"cd {DBT_PROJECT_DIR} && "
            f"dbt build --profiles-dir {DBT_PROFILES_DIR}"
        ),
    )

    dbt_docs_generate = BashOperator(
        task_id="generate_dbt_docs",
        bash_command=(
            f"cd {DBT_PROJECT_DIR} && "
            f"dbt docs generate --profiles-dir {DBT_PROFILES_DIR}"
        ),
    )

    dbt_build >> dbt_docs_generate