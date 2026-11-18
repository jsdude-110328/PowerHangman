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


## 프로그램 로직
# 1. Get-Words 함수로 정답 단어 뽑아오기
# 2. Input-User 함수로 유저에게 알파벳 입력
# 3. 정답 단어를 리스트로 분해 후 -eq로 비교해 true면 출력, false면 출력X
# 4. 만약 8번 틀릴시 오답, 그 이전에 맞으면 정답.
# 5. 시간 재는 기능 추가해 정답인 경우 결과 기록용 csv파일에 저장.