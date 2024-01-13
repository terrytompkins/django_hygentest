import json
import subprocess

def generate_views(models):
    subprocess.run(['hygen', 'view', 'new', '--app', 'retail_store', '--models', json.dumps(models)])

def main():
    with open('models.json') as file:
        data = json.load(file)
        generate_views(data['models'])

if __name__ == "__main__":
    main()
