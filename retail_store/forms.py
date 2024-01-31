from django import forms

from .models import MyModel

class MyModelForm(forms.ModelForm):
    class Meta:
        model = MyModel
        fields = '__all__'


from .models import RelatedModel

class RelatedModelForm(forms.ModelForm):
    class Meta:
        model = RelatedModel
        fields = '__all__'


