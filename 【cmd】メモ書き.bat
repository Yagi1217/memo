rem ネットワーク上のMACアドレスを確認する
arp -a

rem PCをワークグループ「WORKGROUP」へ参加させる
wmic ComputerSystem where "name='%computername%'" call JoinDomainOrWorkgroup Name="WORKGROUP"

rem PCの名前「%computername%」を変更する
wmic computersystem where name="%computername%" call rename name="NEW_PC_NAME"
