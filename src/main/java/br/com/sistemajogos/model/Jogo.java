
package br.com.sistemajogos.model;

import java.time.LocalDate;

public class Jogo {

    // Atributos
    private String nome;
    private LocalDate dataLancamento;
    private String genero;

    // Construtor
    public Jogo(String nome, LocalDate dataLancamento, String genero) {
        this.nome = nome;
        this.dataLancamento = dataLancamento;
        this.genero = genero;
    }

    // Getters e Setters
    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public LocalDate getDataLancamento() {
        return dataLancamento;
    }

    public void setDataLancamento(LocalDate dataLancamento) {
        this.dataLancamento = dataLancamento;
    }

    public String getGenero() {
        return genero;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }
}
