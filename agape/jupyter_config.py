# Append to ~/.jupyter/jupyter_notebook_config.py
c = get_config()
c.NotebookApp.ip = '*'
c.NotebookApp.open_browser = False
c.NotebookApp.port = 5000