def UnpackRequestData( _Receivefilename ,_Unpackfilename)
	begin
		puts(_Receivefilename)
		file = open(_Receivefilename,"rb")
		info = file.read(3)
		puts (info.unpack('H2H2H2'))
		
		file2 = open(_Unpackfilename,"wb")
		info = file2.write(info.unpack('H2H2H2'))
		#info  # �̫�p�⪺���e���Ǧ^��
	rescue
		puts("Can not read file")		
		nil   # �L�kŪ���ɮסH���N���Ǧ^�r��
	ensure
		file.close   # �T�w�@�w�n����	
		file2.close   # �T�w�@�w�n����	
	end	
end

UnpackRequestData("HostReceive.txt","HostUnpack.txt")