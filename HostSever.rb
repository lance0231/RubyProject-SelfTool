$KCODE = "UTF-8"
require "socket"

def TcpSeverInit
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

def SaveReceiveData( filename , data, datalen)
	begin
		puts(filename)
		file = open(filename,"w")
		info = file.write(data,datalen)
		info  # 最後計算的內容為傳回值
	rescue
		puts("Can not write file")		
		nil   # 無法寫入檔案？那就不傳回字串
	ensure
		file.close   # 確定一定要做的	
	end
end


puts("檔案寫入")
puts(SaveReceiveData("TestWriteData.dat","I am a stupid person"),18)
puts("write end")
TcpSeverInit()

__END__