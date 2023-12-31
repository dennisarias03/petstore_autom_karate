function fn() {

    var config = { // base config JSON
        baseUrl: 'https://petstore.swagger.io/v2/'
    };
    // don't waste time waiting for a connection or if servers don't respond within 5 seconds
    karate.configure('connectTimeout', 6000);
    karate.configure('readTimeout', 6000);

    config.faker = Java.type('com.github.javafaker.Faker');
    return config;


}

