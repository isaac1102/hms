# HMS (Homework Management System)
# 1. 소개
- 학생과제관리로 인해 고생하는 아내를 위해 간단하게 만들어 보았습니다.
- 그동안 주로 사용해왔던 Spring의 기능들을 복습하고 정리할 겸 만들어보았습니다.

# 2. 기술스펙
Spring을 기반으로 간단한 CRUD와, 파일업로드가 주 기능입니다. 
- Spring
- Mybatis
- MySql
- jsp
- aws ec2

# 3. 기능요약
- 이미지 파일업로드(이미지만 가능)
- CRUD
- Filter를 통한 사용자 IP체크(신원미상의 누군가로부터 지속적인 해킹시도 때문에...)
- Interceptor를 사용한 권한 및 세션체크
- 비밀번호 단방향 암호화
- 파일저장경로 계층화 및 파일명 해시처리

# 4. 향후 방향
- Spring 3.x ->  Springboot로 전환할 예정입니다.
- jsp -> vue프레임워크로 전환할 예정입니다.
