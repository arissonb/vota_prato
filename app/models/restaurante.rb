class Restaurante < ApplicationRecord
    has_many :qualificacoes , dependent: :destroy
    has_and_belongs_to_many :pratos , dependent: :destroy
    has_many :comentarios, as: :comentavel , dependent: :destroy
    
    
    validate :primeira_letra_deve_ser_maiuscula
    validates_presence_of :nome, message: "deve ser preenchido"
    validates_presence_of :endereco, message: "deve ser preenchido"
    validates_presence_of :especialidade, message: "deve ser preenchido"
    validates_uniqueness_of :nome, message: "nome já cadastrado"
    validates_uniqueness_of :endereco, message: "endereço já cadastrado"

    has_attached_file :foto, :styles => { large: "600x600>",:medium => "300x300#", :thumb => "150x150>" }, :default_url => "/images/:style/missing.png"
    validates_attachment_content_type :foto, :content_type => /\Aimage\/.*\Z/
    def to_s
        nome
    end
    
    private
        def primeira_letra_deve_ser_maiuscula
            errors.add(:nome,"primeira letra deve ser maiúscula") unless nome =~ /[A-Z].*/
        end

        
        
    
    
end
