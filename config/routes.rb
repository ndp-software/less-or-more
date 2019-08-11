Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  resources :quiz_questions
  resources :question_data_points
  resources :questions
  resources :quizzes
  resources :references
  resources :data_points
  resources :data_sets
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
