## Sauce Demo Automated Test
Automation test framework for Lyte QA Engineer assessment test

### Pre-requisites
- [Python 3](https://www.python.org/downloads/)
- [Pip](https://pip.pypa.io/en/stable/installation/)
- [Chrome](https://www.google.com/intl/id_id/chrome/)
- [ChromeDriver](https://chromedriver.chromium.org/downloads)

### Installation
- download and install [PyCharm](https://www.jetbrains.com/pycharm/) or any IDE that supports robot framework and Python
- clone/import project from VCS
- make sure that ChromeDriver already in execution path
- activate python virtual environments
```
cd venv\Scripts
activate
```
- if you're using [PyCharm](https://www.jetbrains.com/pycharm/) :
  - install plugin Robot Framework Support
  - set Python Interpreter from Settings > Project:rc_automation > Python Interpreter 
  - set terminal to use virtual env automatically from Settings > Tools > Terminal > check `Activate virtualenv`
- set config variables on `config\env.py`
- install project requirements `pip install -r requirements.txt`
- execute test files `robot tests/[filename.robot]`
- observe test result on `report.html`
