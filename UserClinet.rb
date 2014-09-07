$KCODE = "UTF-8"
require "socket"

def TcpClientInit
	begin
		port = 8080
		server = TCPServer.new("0.0.0.0",port)
		loop{
			puts("connecting...")
			Thread.fork(server.accept){|sock|
			begin
				#puts("connecting...")
			ensure
				sock.close unless sock.closed?
			end
			}
		}
	rescue
		puts("Create TCP Server Fail")		
		nil  
	ensure
		# ... 確定一定要做的			
	end
end

__END__