def get_page_limit(pageSize, pageNo):
    try:
        pageNo = int(pageNo) if pageNo else 1
        pageSize = int(pageSize) if pageSize else 10
        return (pageNo - 1) * pageSize, pageSize * pageNo
    except Exception:
        return 1, 10
