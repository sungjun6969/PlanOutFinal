window.addEventListener("load", () => {
    document.querySelectorAll("button.delete").forEach(button => {
        button.addEventListener("click", e => {
            const { id } = e.target.dataset;
    
            alert("장바구니 제품을 삭제하시겠습니까?");
            
            fetch(`/cart/${id}`, {
                method: "DELETE"
            }).then(resp => {
                if(resp.ok) {
                    alert("삭제 완료");

                    const button = document.querySelector(`button.delete[data-id='${id}']`);
                    button.closest("tr").remove();
                }
            });
        });
    });    
});