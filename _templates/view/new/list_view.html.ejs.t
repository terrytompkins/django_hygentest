---
to: templates/<%- h.changeCase.snakeCase(model.name) %>_list.html
force: true
---
{% extends 'base.html' %}

{% block content %}
<div class="container">
    <h2><%- h.changeCase.titleCase(model.name) %> List</h2>
    <table>
        <thead>
            <tr>
            <% model.fields.forEach(function(field) { %>
                <th><%- h.changeCase.titleCase(field.name) %></th>
            <% }); %>
            </tr>
        </thead>
        <tbody>
            {% for item in object_list %}
            <tr>
                <% model.fields.forEach(function(field) { %>
                <td>{{ item.<%- field.name %> }}</td>
                <% }); %>
            </tr>
            {% endfor %}
        </tbody>
    </table>
</div>
{% endblock %}
