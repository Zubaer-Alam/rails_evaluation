Prerequisites:

   1. Git    : https://git-scm.com/book/en/v2/Getting-Started-Installing-Git
   2. Docker : https://docs.docker.com/engine/install/

Steps:

   1. Navigate to the directory where you want to clone the repository.
   2. Open a terminal inside the folder and clone the repository by running the following command:
                
          git clone https://github.com/Zubaer-Alam/rails_evaluation
          
   3. Navigate to the app directory:
            
          cd rails_evaluation
          
   4. Build and run the Docker containers:
         
          docker compose up -d
          
   5. Open your browser and access http://localhost:3001 to view the app.
   6. After you have finished viewing the app, stop the containers:

          docker compose down

N.B: When accessing localhost:3001, if you get an error saying "ERR_SSL_PROTOCOL_ERROR", try accessing the application using incognito mode or clearing the browser cache data.
This occurs because the browser tries to access "https://localhost:3001" instead of "http://locahost:3001". I am working on a fix for the problem. 

By default, you can view the application on other devices on your local network. To do this, run "ipconfig" on your host machine's terminal and get the local IPv4 address of your machine.
Then you can access the application on any other device on the same network by accessing http://<your_ip_address>:3001 
