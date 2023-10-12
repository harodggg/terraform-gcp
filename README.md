# terraform-gcp


# what do you need to do before you start
### 1, install terraform-gcp
### 2, configure the crediential_file that is from google cloud service in variables.tf;
### 3, congigure the project id that is from google cloud project in variables.tf;

# define your needs in variables.tf file
### 1, the machine number -- 机器数量
### 2，startup_script -- 第一次创建机器时运行的命令
### 3，......

# start running
### 1, terraform init -- download provider,and initita envioment
### 2, terraform plan -- check the configuation
### 3, terraform apply -- running,you maybe select yes by terraform apply -auto-approve
### 4, terraform destroy -- destroy machine etc..you maybe select yes by terraform apply -auto-approve
