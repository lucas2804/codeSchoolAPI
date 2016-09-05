# codeSchoolAPI
codeSchoolAPI is my boilerplate, I've structured code into admin_namespace and api_namespace, authentication with devise, simple example about accepts_nested_attributes_for with 2 level test-nQuestions-nAnswers, and decorated with adminlte theme.

1. clone code from github 
2. ```rake db:migrate```
3. ```rake db:seed``` to get sample data

# The things that I've covered:

##Admin space:
Example user:
    email: super_teacher@gmail.com
    password: 1234qwer

1. Authenticate just "Teacher" role can access CRUD of Admin space

2. Manage Users http://localhost:3000/admin/users 
    - Role "Teacher" as super-admin and Role "Student" as normal-user

3. Manage Tests  http://localhost:3000/admin/tests
    - Be able to add more "Questions" and "Answers" for each "Test"

##API space:

1. Sign in through curl -i --data "email=super_teacher@gmail.com&password=1234qwer" localhost:3000/api/users/sign_in to get "auth_token" (generate new auth_token)

2. Sign out through curl -X DELETE -F "auth_token=3e618baa0851a9fb0042014d51951918" "http://localhost:3000/api/users/sign_out" (generate new auth_token)

3. Get list of Tests include Questions and Answers
    - curl -X GET -H "Authorization: 88629620ed3392a24f8fd2a8bb7c3f99" "http://localhost:3000/api/v1/tests.json" (88629620ed3392a24f8fd2a8bb7c3f99 is auth_token)
    
4. Get "Test"
    - curl -X GET -H "Authorization: f4af3f3d257bddcffd08a97816acf859" "http://localhost:3000/api/v1/tests/1.json"
    
5. Save Test results
    - curl -X POST -H "Authorization: f4af3f3d257bddcffd08a97816acf859" -F "[test_result]test_id=5" -F "[test_result]question_id=2" -F "[test_result]answer_id=3" "http://localhost:3000/api/v1/test_results.json"
    - "user_id" and "question_id" are unique fields


## Contributors
 * codeschool.com (Surviving APIs with Rails Courses) ([@codeschool.com](http://codeschool.com)) 

## Copyright

