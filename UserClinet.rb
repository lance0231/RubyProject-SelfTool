$KCODE = "UTF-8"
require "socket"

def TcpClientTest
	begin
		port = 8080
		client = TCPSocket.open("localhost",port)
		client.write("123456")
		
	rescue
		puts("Create TCP Client Fail")		
		nil  
	ensure
		# ... 確定一定要做的			
	end
end

TcpClientTest()

__END__