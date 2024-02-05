---
to: templates/<%- h.changeCase.snakeCase(model_name) %>/form.html
force: true
---
<% var isUpdate = false; %>
{% extends 'base.html' %}

{% block content %}
<% let parsedModel = Array.isArray(model) ? model : JSON.parse(model); -%>
<div class="container">
    <h2><% if (isUpdate) { %>Update<% } else { %>Create<% } %> <%- h.changeCase.titleCase(parsedModel.name) %></h2>
    <form method="post">
        {% csrf_token %}
        {{ form.as_p }}
        <button type="submit" class="btn btn-primary">Submit</button>
    </form>
</div>
{% endblock %}
