package com.resilience.labs;

import java.util.Locale;
import java.util.function.Function;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

@SpringBootApplication
public class FunctionApplication {

  public static void main(String[] args) {
    SpringApplication.run(FunctionApplication.class, args);
  }

  /**
   * Implements your business logic here
   *
   * @return String (you may serialize JSON or another DTO type)
   */
  @Bean
  Function<String, String> functionName() {
    return value -> value.toLowerCase(Locale.ROOT);
  }
}
