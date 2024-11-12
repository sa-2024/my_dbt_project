# my_dbt_project

### Checkout the project

```bash
git clone git@github.com:sa-2024/my_dbt_project.git

cd ~/projects/github/my_dbt_project
```

### check or install python version

```bash
python --version

pyenv install -l | grep -e '3.9'
pyenv install 3.9.20
pyenv shell 3.9.20

pyenv versions

pyenv local 3.9.20
```

### Build Project

```bash
python -m venv venv
source venv/bin/activate
#or for windows
venv\Scripts\activate

pip install -r requirements.txt

# validate "dbt" tool is install in venv using
which dbt
# it should display relative path as "my_dbt_project/venv/bin/dbt
dbt --version

# install dbt packages
dbt deps
```

### Start Postgres 
```bash
docker run --name dbt-postgres-container-v1 -e POSTGRES_USER=dbt_user -e POSTGRES_PASSWORD=dbt_password -e POSTGRES_DB=dbt_database -p 15432:5432 -d postgres

docker stop dbt-postgres-container-v1

# connect to postgres db  
pip install pgcli
pgcli -h localhost -U dbt_user -d dbt_database -p 15432
# pwd= dbt_password
```

## Seed DB; one time
```bash
dbt seed
```

## Run to create db objects and seed the data
```bash
dbt run
```

## Run to test the data
```bash
dbt test

# to run individual test
dbt test --debug --select "person"
```

## Close Project

```bash
deactivate
```
