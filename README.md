# 🔍 Github Followers

## 📖 목차
1. [소개](#-소개)
2. [실행 화면](#-실행-화면)
3. [트러블 슈팅](#-트러블-슈팅)
4. [참고 링크](#-참고-링크)

</br>

## 🍀 소개
GitHub 사용자의 팔로워를 검색해 볼 수 있습니다. 검색한 팔로워의 GitHub 프로필과 검색한 팔로워를 팔로워 한 목록을 다시 검색할 수 있습니다. 즐겨찾기에 원하는 사용자를 저장할 수 있습니다.

* 주요 개념: `Reusable View`, `Pagination`, `Diffable Data Source`

</br>

## 💻 실행 화면 

| 사용자명 확인 | 팔로워 검색 |
|:--------:|:--------:|
|<img src="https://github.com/Hoon94/GithubFollowers/assets/43189761/f1ec19dd-db58-4e0f-88db-caaac90ee7ac" width="300">|<img src="https://github.com/Hoon94/GithubFollowers/assets/43189761/3fc27260-96c2-40f8-880c-e2bc142cfd86" width="300">|

| 즐겨찾기 추가 | 팔로워 리스트 검색 |
|:--------:|:--------:|
|<img src="https://github.com/Hoon94/GithubFollowers/assets/43189761/095096f8-d670-4bcd-a034-96b3e5262914" width="300">|<img src="https://github.com/Hoon94/GithubFollowers/assets/43189761/4d230e6a-4bfd-45a8-ab48-910bb9e1918e" width="300">|

| 프로필 확인 | 다음 팔로워로 이동 |
|:--------:|:--------:|
|<img src="https://github.com/Hoon94/GithubFollowers/assets/43189761/bb7dd9a7-2205-40d0-8f8e-f920ad740d15" width="300">|<img src="https://github.com/Hoon94/GithubFollowers/assets/43189761/63d4983a-6d82-4872-859c-c07f71468cc7" width="300">|

| 즐겨찾기 삭제 | 라이트/다크 모드 지원 |
|:--------:|:--------:|
|<img src="https://github.com/Hoon94/GithubFollowers/assets/43189761/455ca9dc-3aab-4798-b3d5-c66d28b6f172" width="300">|<img src="https://github.com/Hoon94/GithubFollowers/assets/43189761/a81b63c1-1522-4a56-a1f0-ae97ec15bd03" width="300">|

</br>

## 🧨 트러블 슈팅

1️⃣ **Reuseable한 View 생성** <br>
-
🔒 **문제점** <br>
- 매번 `View`를 생성하는 경우 `View Controller`가 복잡해질 수 있다는 문제가 있습니다.

🔑 **해결방법** <br>
- 이를 해결하기 위해 유사한 `View`를 생성할 수 있는 `reuseable`한 `View`를 정의하였습니다. 프로젝트 이름의 앞 글자를 따서 `GFButton`과 같이 정의한 `View` 앞에 `GF`라는 수식어를 붙였습니다.

<br>

2️⃣ **Navigation Bar 숨기기** <br>
-
🔒 **문제점** <br>
- `viewDidLoad` 메서드에서 다음과 같이 `navigation bar`에 대한 처리를 진행했습니다.
    
    ```swift
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    ```
    
    다음 화면으로 넘어가게 되면 이때부터 `navigation bar`를 보이게 하기 위해 `isNavigationBarHidden` 프로퍼티를 `true`로 변경합니다.
    
    위와 같이 코드를 작성한 경우 다음 화면에서 이전 화면으로 돌아갈 때 `viewDidLoad`는 다시 호출되지 않아 `navigation bar`가 보이는 문제가 있었습니다.

🔑 **해결방법** <br>
- View lifecycle을 확인하고 매번 다시 호출되는 viewWillAppear 메서드를 활용하여 다음과 같이 코드를 수정하였습니다.

    ```swift
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    ```
    
    위와 같이 코드를 수정한 경우 이전 화면으로 돌아갈 때 viewWillAppear가 다시 호출되며 navigation bar를 감추게 됩니다.

<br>

3️⃣ **검색시 올바른 Username인지 확인하기** <br>
-
🔒 **문제점** <br>
- GitHub에서 계정을 생성 시 Username은 다음과 같은 제약 조건을 따라야 한다.
    - [About username normalization](https://docs.github.com/en/enterprise-cloud@latest/admin/identity-and-access-management/iam-configuration-reference/username-considerations-for-external-authentication#about-username-normalization)
    
    기존 사용하던 빈 문자열 체크와 같은 처리에서는 위와 같은 조건에 대해 Username이 올바른지 확인하기 어려운 문제가 있었습니다. 

🔑 **해결방법** <br>
- [정규표현식](https://developer.mozilla.org/ko/docs/Web/JavaScript/Guide/Regular_Expressions)을 활용해 다음과 같은 식을 사용하였습니다.

    ```swift
    "/^[a-z\d](?:[a-z\d]|-(?=[a-z\d])){0,38}$/i"
    ```

<br>

4️⃣ **화면 블러처리** <br>
-
🔒 **문제점** <br>
- 화면에 사용자를 위한 알림창을 띄울 때 알림창에 대한 집중도를 높이기 위한 방법이 필요했습니다. 

🔑 **해결방법** <br>
- 이를 해결하기 위해 알림창 뒤에 있는 화면을 블러 처리하거나 투명도를 낮춤으로 알림창에 사용자가 더 집중할 수 있도록 해결하였습니다.

    | 1. 투명도 조절 | 2. 블러 처리 |
    | :---------: | :--------: |
    | <Img src = "https://github.com/Hoon94/GithubFollowers/assets/43189761/897345fd-b733-4f29-b5cb-bde9bf8133f5" width="300"> | <Img src = "https://github.com/Hoon94/GithubFollowers/assets/43189761/2ecefbc8-a2ce-455a-ab93-ec01147e6221" width="300">|

    - 1. 배경화면 투명도 조절

        ```swift
        view.backgroundColor = UIColor.black.withAlphaComponent(0.75)
        ```
    
    - 2. 배경화면 블러 처리

        ```swift
        let blurEffect = UIBlurEffect(style: .dark)
        let blurredEffectView = UIVisualEffectView(effect: blurEffect)
        blurredEffectView.frame = view.bounds
        view.addSubview(blurredEffectView)
        ```

<br>

5️⃣ **Pagination 처리** <br> 
-
🔒 **문제점** <br>
- 사용자의 팔로워를 받아오기 위해 GitHub에서 제공하는 API를 사용하였습니다.

    [GitHub Docs: List followers of a user](https://docs.github.com/en/rest/users/followers?apiVersion=2022-11-28#list-followers-of-a-user)
    
    위 GitHub에서 제공하는 API 문서에 따르면 한 번에 받아 올 수 있는 팔로워의 정보는 최대 100명이었습니다. 사용자의 팔로워가 100명이 넘어가는 경우에 대해 추가적으로 정보를 받아와야 하는 문제가 발생하였습니다.

🔑 **해결방법** <br>
- 이를 해결하기 위해 사용자의 팔로워를 받아올 때 받은 데이터의 수를 확인하는 코드를 추가하였습니다. 만약 100명의 데이터를 받아오는 경우 이후 추가적인 팔로워가 있을 수 있음을 나타내며 100보다 적은 데이터의 팔로워를 받은 경우 마지막 page의 데이터를 받았다는 것을 나타내도록 하였습니다.

    ```swift
    private func getFollowers(username: String, page: Int) {
        NetworkManager.shared.getFollowers(for: username, page: page) { [weak self] result in
            guard let self = self else { return }

            switch result {
            case .success(let followers):
                if followers.count < 100 { self.hasMoreFollowers = false }

                self.followers.append(contentsOf: followers)
                self.updateData()
            case .failure(let error):
                self.presentGFAlertOnMainThread(title: "Bad Stuff Happened", message: error.rawValue, buttonTitle: "Ok")
            }
        }
    }
    ```

    또한 추가적으로 더 많은 팔로워를 다시 받아오기 위해 언제 데이터를 새로 받아야 하는지를 나타내야 했습니다. 새로 받아올 팔로워가 더 있으며 컬렉션뷰의 맨 아래까지 스크롤을 내린 경우 다음 페이지에서 추가적인 팔로워를 받을 수 있도록 하였습니다.
    
    ```swift
    extension FollowerListViewController: UICollectionViewDelegate {
        func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
            let offsetY = scrollView.contentOffset.y
            let contentHeight = scrollView.contentSize.height
            let height = scrollView.frame.size.height

            if offsetY > contentHeight - height {
                guard hasMoreFollowers else { return }

                page += 1
                getFollowers(username: username, page: page)
            }
        }
    }
    ```

<br>

6️⃣ **새로운 팔로워 검색 시 검색 목록 상단으로 돌아가기** <br>
-
🔒 **문제점** <br>
- 팔로워 목록에서 다른 사용자를 검색하여 새로운 팔로워 목록을 받아올 때 갱신된 목록 화면이 최상단으로 돌아가지 않는 문제가 있었습니다.

🔑 **해결방법** <br>
- 이를 해결하기 위해 

    ```swift
    extension FollowerListViewController: UserInfoViewControllerDelegate {
        func didRequestFollowers(for username: String) {
            self.username = username
            title = username
            page = 1
            hasMoreFollowers = true
            followers.removeAll()
            filteredFollowers.removeAll()
            collectionView.scrollToItem(at: IndexPath(item: 0, section: 0), at: .top, animated: true)

            if isSearching {
                navigationItem.searchController?.searchBar.text = ""
                navigationItem.searchController?.isActive = false
                navigationItem.searchController?.dismiss(animated: false)
                isSearching = false
            }

            getFollowers(username: username, page: page)
        }
    }
    ```
    
    위와 같이 코드를 작성하였습니다. 특히 `scrollToItem()` 메서드를 사용하여 0번째 아이템 즉, 컬렉션뷰에 있는 아이템 중 가장 앞에 있는 아이템에 맞춰 스크롤을 끌어올릴 수 있도록 수정하였습니다.

<br>

7️⃣ **Pagination race condition** <br>
-
🔒 **문제점** <br>
- 검색한 팔로워 리스트의 스크롤을 끝까지 내리면 `Github API`를 사용하여 추가적인 팔로워를 받아옵니다. 하지만 네트워크를 통해 데이터를 받아오는 중에 사용자는 여러 번 팔로워를 새로 불러오도록 스크롤을 내릴 수 있습니다. 이런 경우 아직 받아오지 않은 데이터가 있음에도 새로운 네트워크 통신이 발생하여 올바르지 않은 동작을 일으킵니다.

🔑 **해결방법** <br>
- 이를 해결하기 위해 `isLoadingMoreFollowers` 변수를 생성하여 현재 받아오는 데이터가 있다면 추가적으로 받아오는 작업을 진행하지 못하도록 막았습니다. 먼저 실행한 네트워크 작업이 완료된 후에 `isLoadingMoreFollowers`는 `false`로 변경되고 다시 스크롤을 내려 다음 팔로워 리스트를 받아올 수 있습니다.

<br>

8️⃣ **async/await** <br>
-
🔒 **문제점** <br>
- `getFollowers` 메서드를 사용해 팔로워 리스트를 받아옵니다.

    ```swift
    func getFollowers(for username: String, page: Int, completed: @escaping (Result<[Follower], NetworkError>) -> Void) {
        let endpoint = baseURL + "\(username)/followers?per_page=100&page=\(page)"

        guard let url = URL(string: endpoint) else {
            completed(.failure(.invalidUsername))
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }

            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }

            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }

            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let followers = try decoder.decode([Follower].self, from: data)
                completed(.success(followers))
            } catch {
                completed(.failure(.invalidData))
            }
        }

        task.resume()
    }
    ```
    이렇게 작성한 코드는 네트워크를 사용하여 데이터를 받아옵니다. 코드가 작성한 순서대로 동작하지 않는다는 부분에서 가독성이 좋지 않았습니다.


🔑 **해결방법** <br>
- 이를 해결하기 위해 `async/await`을 사용하여 다음과 같이 코드를 작성해 보았습니다. 작성한 코드를 보면 작성한 순서대로 코드가 동작함을 알 수 있습니다. 이를 통해 코드의 가독성을 높일 수 있었습니다.

    ```swift
    func getFollowers(for username: String, page: Int) async throws -> [Follower] {
        let endpoint = baseURL + "\(username)/followers?per_page=100&page=\(page)"
        
        guard let url = URL(string: endpoint) else {
            throw NetworkError.invalidUsername
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw NetworkError.invalidResponse
        }
        
        do {
            return try decoder.decode([Follower].self, from: data)
        } catch {
            throw NetworkError.invalidData
        }
    }
    ```
    
</br>

## 📚 참고 링크
- [🍎Apple Docs: UICollectionView](https://developer.apple.com/documentation/uikit/uicollectionview)
- [🍎Apple Docs: UICollectionViewDiffableDataSource](https://developer.apple.com/documentation/uikit/uicollectionviewdiffabledatasource)
- [🍎Apple Docs: Updating an App to Use Swift Concurrency](https://developer.apple.com/documentation/swift/updating_an_app_to_use_swift_concurrency)
- [👨‍💻Github Docs: 팔로워 API](https://docs.github.com/ko/rest/users/followers?apiVersion=2022-11-28#list-followers-of-a-user)
- [📘blog: Child View Controllers](https://www.swiftbysundell.com/basics/child-view-controllers/)
</br>
