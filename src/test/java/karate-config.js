function fn() {
    karate.configure('connectTimeout', 5000);
    karate.configure('readTimeout', 5000);
    // karate.configure('abortSuiteOnFailure', true);

    var protocol = 'http';
    var server = '192.168.0.182:8080';
    if (karate.env == 'prod') {
        protocol = 'https';
        server = 'thinking-tester-contact-list.herokuapp.com';
    }

    var config = {
        baseUrl: protocol + '://' + server,
        
        // Variables de credenciales
        userEmail: 'jairleal@email.com',
        userPassword: '12345678',
        
        // Variables de endpoints
        loginEndpoint: '/users/login',
        contactsEndpoint: '/contacts',
        
        // Variables de headers
        contentType: 'application/json',
        acceptHeader: 'application/json',
        
        // Variables de datos de contacto 
        contactData: {
            firstName: 'Jair Santiago',
            lastName: 'Leal Miranda',
            birthdate: '2002-10-07',
            email: 'jair@email.com',
            phone: '3001234567',
            street1: 'Calle 10 # 45-67',
            street2: 'Apartamento 302',
            city: 'Medellín',
            stateProvince: 'Antioquia',
            postalCode: '050001',
            country: 'Colombia'
        }
    };
    config.faker = Java.type('com.github.javafaker.Faker');

    return config;
}
