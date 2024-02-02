from django.views import generic


from .models import MyModel

class MyModelListView(generic.ListView):
    model = MyModel
    template_name = 'mymodel_list.html'
    context_object_name = 'all_mymodel'

class MyModelDetailView(generic.DetailView):
    model = MyModel
    template_name = 'mymodel_detail.html'

class MyModelCreateView(generic.CreateView):
    form_class = MyModelForm
    template_name = 'mymodel_form.html'

class MyModelUpdateView(generic.UpdateView):
    form_class = MyModelForm
    model = MyModel
    template_name = 'mymodel_form.html'


from .models import RelatedModel

class RelatedModelListView(generic.ListView):
    model = RelatedModel
    template_name = 'relatedmodel_list.html'
    context_object_name = 'all_relatedmodel'

class RelatedModelDetailView(generic.DetailView):
    model = RelatedModel
    template_name = 'relatedmodel_detail.html'

class RelatedModelCreateView(generic.CreateView):
    form_class = RelatedModelForm
    template_name = 'relatedmodel_form.html'

class RelatedModelUpdateView(generic.UpdateView):
    form_class = RelatedModelForm
    model = RelatedModel
    template_name = 'relatedmodel_form.html'


