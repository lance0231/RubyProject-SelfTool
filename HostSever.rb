$KCODE = "UTF-8"
require "socket"

def SaveReceiveData( filename , data)
	begin
		puts(filename)
		file = open(filename,"wb")
		if ( File.writable?(filename) == true)
			puts("檔案可被寫入")
		else
			puts("檔案不可被寫入")
		end
		info = file.write(data)
#		@NowLoc = 0
#		while @NowLoc <= datalen
#			file.putc(data[@NowLoc])
#			@NowLoc = @NowLoc + 1
#		end	
		info  # 最後計算的內容為傳回值
	rescue
		puts("Can not write file")		
		nil   # 無法寫入檔案？那就不傳回字串
	ensure
		file.close   # 確定一定要做的	
	end
end

def TcpSeverBuild
	begin
		port = 8012
		server = TCPServer.new("0.0.0.0",port)
		loop{
			puts("connecting...")
			Thread.fork(server.accept){|sock|
			begin			
				@FileWriteLength = 0
				@FileWriteLength = SaveReceiveData("HostReceive.txt",sock.gets)				
				puts(@FileWriteLength)
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

#puts("檔案寫入")
#data = [0x12,0x13,0x14]
#puts(SaveReceiveData("TestWriteData.dat",data))
#puts("write end")
TcpSeverBuild()

__END__