package userinfo

class Login {
    Integer userId
    String username
    Date loginTime
    String emailAddress
    String password
    String facebookHandle

    static constraints = {
        emailAddress nullable: true;
        facebookHandle nullable: true;
        password nullable: true;
        version: false;
    }
}
