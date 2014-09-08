def UnpackRequestData( _Receivefilename ,_Unpackfilename)
	begin
		puts(_Receivefilename)
		file = open(_Receivefilename,"rb")
		info = file.read(3)
		puts (info.unpack('H2H2H2'))
		
		file2 = open(_Unpackfilename,"wb")
		info = file2.write(info.unpack('H2H2H2'))
		#info  # 最後計算的內容為傳回值
	rescue
		puts("Can not read file")		
		nil   # 無法讀取檔案？那就不傳回字串
	ensure
		file.close   # 確定一定要做的	
		file2.close   # 確定一定要做的	
	end	
end

UnpackRequestData("HostReceive.txt","HostUnpack.txt")