clear:
	./gradlew clean

test:
	./gradlew test

mutation:
	./gradlew pitest

format:
	./gradlew goJF

create:
	./gradlew shadowJar

run:
	./gradlew bootRun