package mini.asaas

class IndexController {

    def index() { }

    def processForm(){
        if (params) {
            params.each { key, value ->
                println "$key: $value"
            }
        } else {
            println "No params"
        }
        redirect(uri: "/")
    }
}
