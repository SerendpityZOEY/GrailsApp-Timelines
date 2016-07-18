package userinfo

class LoginController {

    def index() {
        render view:"login"
    }

    def login() {
        render view:"login"
    }

    def insertUserInfo(username) {
        def record = Login.findAllWhere(username: username)

        if (record.isEmpty()) {
            def id = 1
            def row = Login.list([sort: 'userId', order:'desc', max: 1])
            if (row) {
                id = (row.pop().userId as int) + 1
            }
            def datetime = new Date()
            new Login(userId: id, username: username, loginTime: datetime).save()
            session['lastLoginTime'] = datetime
            return id
        } else {
            session['lastLoginTime'] = record['loginTime']
            def datetime = new Date().format("yyyy-MM-dd hh:mm:ss")
            def userId = record['userId'].get(0)
            Login.executeUpdate("update Login set loginTime='$datetime' where userId='$userId'")
            println userId
            return userId
        }
    }


    def redirectUserProfile()  {

        def userId = insertUserInfo(params.userName)
        println ">>>>>>>"
        session['userName'] = params.userName
        session['userId'] = userId
        //forward(controller:"preference", action:"index", model: [userId: params.userid])
        redirect (action: 'index', controller: 'PersonalFeed', params: [userName: params.userName, userId: userId])
    }

    def removeSessionId() {
        session.invalidate()
        redirect(action: "index")
    }
}