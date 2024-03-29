.PHONY: dev nodev
dev:
	docker-compose -f docker-compose-dev.yml up -d
nodev:
	docker-compose -f docker-compose-dev.yml rm -fs


.PHONY: qa
qa:
	poetry run flake8 motor_orm
	poetry run mypy --warn-unused-ignores motor_orm


.PHONY: test
test:
	poetry run pytest \
		-vx --log-level=0 \
		--cov=motor_orm --cov-report xml:cov.xml --cov-report term \
		tests/
