# ダウンロードするファイルのURL
$TargetPathList = "***.csv"
# ローカルの保存先
$DestinationPath = "c:\temp\"

tyr {
    for($Target in $TargetPath) {
        # ファイルのダウンロード
        $web_client = New-Object System.Net.WebClient
        $web_client.DownloadFile($target_url, $file_path)

        #ファイル名抽出
        $fileName = Split-Path $Target -Leaf

        #保存先パス作成（フォルダ + ファイル名）
        $outFilePath = Join-Path $DestinationPath $fileName

        #ファイルダウンロード
        Invoke-WebRequest -Uri $Target.AbsoluteUri -OutFile $outFilePath

        Write-Output $Target + "のダウンロードに成功"
    }
} chach[exception] {
    Write-Output $Target + "のダウンロードに失敗"
}
