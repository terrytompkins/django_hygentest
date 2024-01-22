import json
import subprocess

def generate_models(models):
    subprocess.run(['hygen', 'model', 'new', 'full-model', '--app', 'retail_store', '--models', json.dumps(models)])

def main():
    with open('full-model.json') as file:
        data = json.load(file)
        generate_models(data['models'])

if __name__ == "__main__":
    main()
