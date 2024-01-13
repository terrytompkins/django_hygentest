from django.views import generic


from .models import Book

class BookListView(generic.ListView):
    model = Book
    template_name = 'book_list.html'
    context_object_name = 'all_book'

class BookDetailView(generic.DetailView):
    model = Book
    template_name = 'book_detail.html'


from .models import Author

class AuthorListView(generic.ListView):
    model = Author
    template_name = 'author_list.html'
    context_object_name = 'all_author'

class AuthorDetailView(generic.DetailView):
    model = Author
    template_name = 'author_detail.html'


