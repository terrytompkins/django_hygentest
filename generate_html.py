import json
import subprocess

def generate_html_views(models):
	for model in models:
		# For each model, generate list, detail, create/update form views
		subprocess.run(['hygen', 'html', 'new', 'list_view.html', '--app', 'retail_store', '--model_name', model['name'], '--model', json.dumps(model)])
		# subprocess.run(['hygen', 'html', 'new', 'detail_view.html', '--app', 'retail_store', '--model_name', model['name'], '--model', json.dumps(model)])
		# subprocess.run(['hygen', 'html', 'new', 'form_view.html', '--app', 'retail_store', '--model_name', model['name'], '--model', json.dumps(model)]) # Assuming form_view handles both create and update

def main():
	with open('full-model.json') as file:
		data = json.load(file)
		generate_html_views(data['models'])
		# print(json.dumps(data['models'], indent=2))


if __name__ == "__main__":
    main()
