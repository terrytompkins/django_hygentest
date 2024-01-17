from django import forms

from .models import Book

class BookForm(forms.ModelForm):
    class Meta:
        model = Book
        fields = '__all__'


from .models import Author

class AuthorForm(forms.ModelForm):
    class Meta:
        model = Author
        fields = '__all__'


