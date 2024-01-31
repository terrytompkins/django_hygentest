---
to: templates/<%- h.changeCase.snakeCase(model.name) %>_form.html
force: true
---
{% extends 'base.html' %}

{% block content %}
<div class="container">
    <h2>{% if not object %}Create<% } else %>Update<% } %> <%- h.changeCase.titleCase(model.name) %></h2>
    <form method="post">
        {% csrf_token %}
        {{ form.as_p }}
        <button type="submit" class="btn btn-primary">Submit</button>
    </form>
</div>
{% endblock %}
