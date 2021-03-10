terraform-validate: ./terraform
	cd terraform; \
	terraform init; \
	terraform fmt; \
	terraform validate; \
	terraform plan

terraform-apply: ./terraform
	cd terraform; \
	terraform init; \
	terraform apply --auto-approve

terraform-destroy: ./terraform
	cd terraform; \
	terraform init; \
	terraform destroy --auto-approve

backend-build: ./backend
	cd backend; \
	./gradlew build

backend-ci: ./backend
	cd backend; \
	./gradlew build; \
	./gradlew test

ui-build-nonprod: ./ui
	cd ui; \
	yarn install; \
	yarn build:nonprod; \

ui-ci: ./ui
	cd ui; \
	yarn install; \
	yarn build; \
	yarn test

ui-test-watch: ./ui
	cd ui; \
	yarn test:watch   