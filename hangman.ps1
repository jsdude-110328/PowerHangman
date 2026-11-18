# 단어 리스트 뽑아오기 
$easy_list = (Get-Content -Path ".\easy.txt" -Encoding utf8).Where({ -not [string]::IsNullOrWhiteSpace($_) })
$medium_list = (Get-Content -Path ".\medium.txt" -Encoding utf8).Where({ -not [string]::IsNullOrWhiteSpace($_) })
$hard_list = (Get-Content -Path ".\hard.txt" -Encoding utf8).Where({ -not [string]::IsNullOrWhiteSpace($_) })

# 게임 진행용 함수들
function Get-Words {
    param ($ans)

    switch ($ans) {
        "1" { return $($easy_list | Get-Random) }
        "2" { return $($medium_list | Get-Random) }
        "3" { return $($hard_list | Get-Random) }
    }
}