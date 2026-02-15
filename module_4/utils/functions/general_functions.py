from pathlib import Path

def get_project_root() -> Path:
    """Returns the project root folder."""
    # Start from the current file's directory
    current_path = Path(__file__).resolve()
    
    # Check parents until pyproject.toml is found
    for parent in [current_path] + list(current_path.parents):
        if (parent / "pyproject.toml").exists():
            return parent
            
    # Fallback: if not found, return the current directory or raise an error
    return current_path.parent
