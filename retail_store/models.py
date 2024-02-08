from django.db import models
class Product(models.Model):
	id = models.AutoField(primary_key=true)
	name = models.CharField(max_length=255, unique=true, blank=false, null=false)
	description = models.TextField(blank=true)
	price = models.DecimalField(max_digits=10, decimal_places=2, null=false)
	stock = models.IntegerField(default=0, null=false)
	
	class Meta:
	
		def __str__(self):
			return self.id

class Customer(models.Model):
	id = models.AutoField(primary_key=true)
	first_name = models.CharField(max_length=150, blank=false, null=false)
	last_name = models.CharField(max_length=150, blank=false, null=false)
	email = models.EmailField(unique=true, blank=false, null=false)
	phone = models.CharField(max_length=15, blank=true)
	
	class Meta:
	
		def __str__(self):
			return self.id

class Order(models.Model):
	id = models.AutoField(primary_key=true)
	order_date = models.DateTimeField(auto_now_add=true)
	status = models.CharField(max_length=100, default='pending')
	customer = models.ForeignKey(to='Customer', related_name='orders', on_delete=models.CASCADE)
    
	class Meta:
	
		def __str__(self):
			return self.id

class LineItem(models.Model):
	id = models.AutoField(primary_key=true)
	quantity = models.IntegerField(default=1, null=false)
	price = models.DecimalField(max_digits=10, decimal_places=2, null=false)
	order = models.ForeignKey(to='Order', related_name='line_items', on_delete=models.CASCADE)
	product = models.ForeignKey(to='Product', related_name='line_items', on_delete=models.CASCADE)

	class Meta:
	
		def __str__(self):
			return self.id

