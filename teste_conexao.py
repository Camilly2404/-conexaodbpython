from db_config import init_app, db
from models import Aluno

app = init_app()

with app.app_context():
    #criar um aluno de teste
    aluno = Aluno(nome="João da Silva", email="joao@email.com", senha="123456", serie="7º Ano")
    db.session.add(aluno)
    db.session.commit()

    #buscar alunos
    alunos = Aluno.query.all()
    print("Alunos cadastrados:", [a.nome for a in alunos])