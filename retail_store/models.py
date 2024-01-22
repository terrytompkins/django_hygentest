from django.db import models



class MyModel(models.Model):
    id = models.AutoField()
    name = models.CharField()
    created_at = models.DateTimeField()
    updated_at = models.DateTimeField()

    def __str__(self):
        return self.id



class RelatedModel(models.Model):
    id = models.AutoField()
    info = models.TextField()

    def __str__(self):
        return self.id


