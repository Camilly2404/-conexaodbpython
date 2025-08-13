# dados_exemplo.py
from crud.crud_livro import criar_livro
from crud.crud_aluno import criar_aluno
from crud.crud_professor import criar_professor
from crud.crud_bibliotecario import criar_bibliotecario
from crud.crud_diretor import criar_diretor
from crud.crud_supervisor import criar_supervisor
from crud.crud_reserva import criar_reserva
from crud.crud_emprestimo import criar_emprestimo
from crud.crud_sugestao import criar_sugestao
from crud.crud_historicoleitura import criar_historico
from crud.crud_relatorio import criar_relatorio
from crud.crud_livro import criar_livro as ci_livro
from crud.crud_livro import listar_livros

def popular():
    # Categorias (assume que categoria CRUD existe; se ainda não, insira direto em SQL)
    # Livros
    ci_livro("Dom Casmuro", "Machado de Assis", isbn="9788575412621", sinopse="Romance Clássico", capa=None,  quantidade=3, categoria_id=None)
    ci_livro("A hora da Estrela", "clarisse Lispector", isbn="9788535911500", sinopse="Romance", capa=None,  quantidade=2, categoria_id=None)

    # Alunos
    criar_aluno("João Silva", "joao@escola.local", "senha123", "9A")
    criar_aluno("Maria Oliveira", "maria@escola.local", "senha123", "8B")

    # Professores
    criar_professores("Carlos Souza", "carlos@escola.local", "senha123", disciplina="História")
    criar_professores("Patricia Lima", "patricia@escola.local", "senha123", disciplina"Português")

    # Bibliotecário / Diretor / Supervisor
    criar_bibliotecário("Ana Bibli", "ana.bibli@escola.local", "senha123" )
    criar_diretor("João Diretor", "joao.dir@escola.local", "senha123")
    criar_supervisor("Supervisor X", "supx@escola.local", "senha123")

    # Empréstimo exemplo(aluno 1 pega livro 1)
    criar_emprestimo(1,1)
    # Reserva exemplo
    criar_reserva(2,2)
    # Sugestão
    criar_sugestao(1,1)