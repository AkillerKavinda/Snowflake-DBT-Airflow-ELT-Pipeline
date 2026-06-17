import subprocess
from pathlib import Path


PROJECT_ROOT = Path(__file__).resolve().parents[1]
DBT_PROJECT_DIR = PROJECT_ROOT / "dbt" / "tpch_analytics"


def run_command(command: list[str], cwd: Path) -> None:
    print(f"\nRunning: {' '.join(command)}")
    print(f"Working directory: {cwd}\n")

    result = subprocess.run(command, cwd=cwd, shell=True)

    if result.returncode != 0:
        raise RuntimeError(f"Command failed: {' '.join(command)}")

    print(f"Completed: {' '.join(command)}")


def main() -> None:
    print("Starting ELT pipeline...")

    run_command(["uv", "run", "dbt", "build"], DBT_PROJECT_DIR)
    run_command(["uv", "run", "dbt", "docs", "generate"], DBT_PROJECT_DIR)

    print("\nELT pipeline completed successfully.")


if __name__ == "__main__":
    main()