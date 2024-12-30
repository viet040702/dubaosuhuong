from django.urls import path
from .views import APIViewAI

urlpatterns = [
    path('api/v1/job_future', APIViewAI.as_view()),
    # path('api/v1/job_history', APIViewAI.as_view()),
    path('', APIViewAI.as_view(), name='aimodels'),
]