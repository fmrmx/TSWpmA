void WBotEx(
                float Current_X_Degress_Address,
                float X_Degress_Address,
                float Current_Y_Degress_Address,
                float Y_Degress_Address,
                float Get_If_Aiming_Address,
                float My_X_Location_Address,
                float My_Y_Location_Address,
                float My_Z_Location_Address,
                float Enemy_X_Location_Address,
                float Enemy_Y_Location_Address,
                float Enemy_Z_Location_Address
            )
            { My_X_Location,My_Y_Location,My_Z_Location,Enemy_X_Location,Enemy_Y_Location,Enemy_Z_Location }
            float Returns[12];
            
            
        Start:
		      mov ecx,esp
			  push [Get_If_Aiming_Address]
			  call ReadMemory
			  fldz
			  fld dword ptr [esp]
			  fcom
			  fstsw ax
              sahf
			  fstp dword ptr [esp-4]
			  fstp dword ptr [esp-4]
			  je end
			  push [My_X_Location_Address]
			  call ReadMemory
			  pop eax
			  push [My_Y_Location_Address]
			  call ReadMemory
			  pop edx
			  push [My_Z_Location_Address]
			  call ReadMemory
			  pop ebx
			  mov [My_X_Location],eax
			  mov [My_Y_Location],edx
			  mov [My_Z_Location],ebx
			  push [Enemy_X_Location_Address]
			  call ReadMemory
			  pop eax
			  push [Enemy_Y_Location_Address]
			  call ReadMemory
			  pop edx
			  push [Enemy_Z_Location_Address]
			  call ReadMemory
			  pop ebx
			  cmp eax,0
			  je Testz
			  jmp DontEnd
              
Tesz:
			  cmp edx,0
			  je T1
			  jmp DontEnd
T1:
			  cmp ebx,0
			  je end
DontEnd:
			  push [Enemy_X_Location_Address]
			  call ReadMemory
			  pop eax
			  push [Enemy_Y_Location_Address]
			  call ReadMemory
			  pop edx
			  push [Enemy_Z_Location_Address]
			  call ReadMemory
			  pop ebx
			  mov [Enemy_X_Location],eax
			  mov [Enemy_Y_Location],edx
			  mov [Enemy_Z_Location],ebx
			  fld dword ptr [Enemy_X_Location]
			  fld dword ptr [My_X_Location]
			  fsub
			  fstp dword ptr [My_X_Location]
			  fld dword ptr [Enemy_Y_Location]
			  fld dword ptr [My_Y_Location]
			  fsub
			  fstp dword ptr [My_Y_Location]
			  fld dword ptr [Enemy_Z_Location]
			  fld dword ptr [My_Z_Location]
			  fsub
			  fstp dword ptr [My_Z_Location]
			  fldz
			  fld dword ptr [My_Y_Location]
			  fcom
			  fstsw ax
              sahf
			  fstp dword ptr [esp-4]
			  fstp dword ptr [esp-4]
			  jb C1
			  jmp endC1

C1:
			  fldz
			  fld dword ptr [My_X_Location]
			  fcom
			  fstsw ax
              sahf
			  fstp dword ptr [esp-4]
			  fstp dword ptr [esp-4]
			  jb C1_1
			  jge C1_2
              
              
              
              
              