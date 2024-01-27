from django.urls import path
from . import views

urlpatterns = [

    path('myModels/', views.MyModelListView.as_view(), name='myModels_list'),
    path('myModels/create/', views.MyModelCreateView.as_view(), name='myModel_create'),
    path('myModels/<int:pk>/', views.MyModelDetailView.as_view(), name='myModel_detail'),
    path('myModels/<int:pk>/update/', views.MyModelUpdateView.as_view(), name='myModel_update'),
    path('myModels/<int:pk>/delete/', views.MyModelDeleteView.as_view(), name='myModel_delete'),

    path('relatedModels/', views.RelatedModelListView.as_view(), name='relatedModels_list'),
    path('relatedModels/create/', views.RelatedModelCreateView.as_view(), name='relatedModel_create'),
    path('relatedModels/<int:pk>/', views.RelatedModelDetailView.as_view(), name='relatedModel_detail'),
    path('relatedModels/<int:pk>/update/', views.RelatedModelUpdateView.as_view(), name='relatedModel_update'),
    path('relatedModels/<int:pk>/delete/', views.RelatedModelDeleteView.as_view(), name='relatedModel_delete'),

]
