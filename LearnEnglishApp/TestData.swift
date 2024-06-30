import Foundation

struct Question {
    let question: String
    let correctAnswer: String
    let options: [String]
}

// TOEFL'da en sık çıkan 50 kelime
let testQuestions: [Question] = [
    Question(question: "Abandon", correctAnswer: "Terk etmek", options: ["Terk etmek", "Bulmak", "Başlamak", "Kapatmak"]),
    Question(question: "Abundant", correctAnswer: "Bol", options: ["Bol", "Kıt", "Zayıf", "Güçlü"]),
    Question(question: "Access", correctAnswer: "Erişim", options: ["Erişim", "Çıkış", "Bilet", "Anahtar"]),
    Question(question: "Accurate", correctAnswer: "Doğru", options: ["Doğru", "Yanlış", "Kesin", "Belirsiz"]),
    Question(question: "Acquire", correctAnswer: "Edinmek", options: ["Edinmek", "Kaybetmek", "Vermek", "Almak"]),
    Question(question: "Adjacent", correctAnswer: "Bitişik", options: ["Bitişik", "Uzak", "Alt", "Üst"]),
    Question(question: "Adjust", correctAnswer: "Ayarlamak", options: ["Ayarlamak", "Kırmak", "Yapmak", "Bozmak"]),
    Question(question: "Advantage", correctAnswer: "Avantaj", options: ["Avantaj", "Dezavantaj", "Şans", "Risk"]),
    Question(question: "Analyze", correctAnswer: "Analiz etmek", options: ["Analiz etmek", "İnşa etmek", "Yok etmek", "Geliştirmek"]),
    Question(question: "Ancient", correctAnswer: "Antik", options: ["Antik", "Modern", "Yeni", "Küçük"]),
    Question(question: "Annual", correctAnswer: "Yıllık", options: ["Yıllık", "Aylık", "Günlük", "Saatlik"]),
    Question(question: "Anticipate", correctAnswer: "Beklemek", options: ["Beklemek", "Kaçmak", "Unutmak", "Göndermek"]),
    Question(question: "Apparent", correctAnswer: "Görünür", options: ["Görünür", "Gizli", "Yanlış", "Kırık"]),
    Question(question: "Appropriate", correctAnswer: "Uygun", options: ["Uygun", "Yanlış", "Fazla", "Az"]),
    Question(question: "Arbitrary", correctAnswer: "Keyfi", options: ["Keyfi", "Zorunlu", "Hesaplı", "Planlı"]),
    Question(question: "Assume", correctAnswer: "Varsaymak", options: ["Varsaymak", "Bırakmak", "Satmak", "Büyümek"]),
    Question(question: "Benefit", correctAnswer: "Fayda", options: ["Fayda", "Zarar", "Kayıp", "Risk"]),
    Question(question: "Brief", correctAnswer: "Kısa", options: ["Kısa", "Uzun", "Geniş", "Dar"]),
    Question(question: "Broadcast", correctAnswer: "Yayın yapmak", options: ["Yayın yapmak", "Yıkmak", "Kapatmak", "Temizlemek"]),
    Question(question: "Capable", correctAnswer: "Yetenekli", options: ["Yetenekli", "Yetersiz", "Güçsüz", "Küçük"]),
    Question(question: "Cease", correctAnswer: "Durdurmak", options: ["Durdurmak", "Başlatmak", "Geliştirmek", "Bozmak"]),
    Question(question: "Challenge", correctAnswer: "Meydan okumak", options: ["Meydan okumak", "Kabul etmek", "Unutmak", "Satmak"]),
    Question(question: "Circumstance", correctAnswer: "Durum", options: ["Durum", "Olay", "Kişi", "Yer"]),
    Question(question: "Citizen", correctAnswer: "Vatandaş", options: ["Vatandaş", "Yabancı", "Düşman", "Komşu"]),
    Question(question: "Clarify", correctAnswer: "Açıklamak", options: ["Açıklamak", "Saklamak", "Karıştırmak", "Unutmak"]),
    Question(question: "Classify", correctAnswer: "Sınıflandırmak", options: ["Sınıflandırmak", "Karıştırmak", "Unutmak", "Dağıtmak"]),
    Question(question: "Coherent", correctAnswer: "Tutarlı", options: ["Tutarlı", "Tutarsız", "Güçlü", "Zayıf"]),
    Question(question: "Community", correctAnswer: "Topluluk", options: ["Topluluk", "Birey", "Grup", "Takım"]),
    Question(question: "Complex", correctAnswer: "Karmaşık", options: ["Karmaşık", "Basit", "Kolay", "Açık"]),
    Question(question: "Concept", correctAnswer: "Kavram", options: ["Kavram", "Gerçek", "Yalan", "Hikaye"]),
    Question(question: "Conclude", correctAnswer: "Sonuçlandırmak", options: ["Sonuçlandırmak", "Başlatmak", "Karıştırmak", "Unutmak"]),
    Question(question: "Conduct", correctAnswer: "Yürütmek", options: ["Yürütmek", "Durdurmak", "Yıkmak", "Temizlemek"]),
    Question(question: "Confirm", correctAnswer: "Doğrulamak", options: ["Doğrulamak", "Yanlışlamak", "Unutmak", "Saklamak"]),
    Question(question: "Conflict", correctAnswer: "Çatışma", options: ["Çatışma", "Barış", "Anlaşma", "Güven"]),
    Question(question: "Consequence", correctAnswer: "Sonuç", options: ["Sonuç", "Başlangıç", "Önlem", "Sebep"]),
    Question(question: "Constant", correctAnswer: "Sabit", options: ["Sabit", "Değişken", "Kısa", "Uzun"]),
    Question(question: "Construct", correctAnswer: "İnşa etmek", options: ["İnşa etmek", "Yıkmak", "Durdurmak", "Bozmak"]),
    Question(question: "Context", correctAnswer: "Bağlam", options: ["Bağlam", "Olay", "Kişi", "Yer"]),
    Question(question: "Contradict", correctAnswer: "Çelişmek", options: ["Çelişmek", "Uygulamak", "Geliştirmek", "Durdurmak"]),
    Question(question: "Contrast", correctAnswer: "Karşılaştırmak", options: ["Karşılaştırmak", "Karıştırmak", "Karşılaşmak", "Uygulamak"]),
    Question(question: "Contribute", correctAnswer: "Katkıda bulunmak", options: ["Katkıda bulunmak", "Zarar vermek", "Unutmak", "Saklamak"]),
    Question(question: "Convert", correctAnswer: "Dönüştürmek", options: ["Dönüştürmek", "Bozmak", "Kaybetmek", "Satmak"]),
    Question(question: "Create", correctAnswer: "Oluşturmak", options: ["Oluşturmak", "Yıkmak", "Durdurmak", "Bozmak"]),
    Question(question: "Culture", correctAnswer: "Kültür", options: ["Kültür", "Teknoloji", "Sanat", "Bilim"]),
    Question(question: "Decline", correctAnswer: "Reddetmek", options: ["Reddetmek", "Kabul etmek", "Unutmak", "Saklamak"]),
    Question(question: "Define", correctAnswer: "Tanımlamak", options: ["Tanımlamak", "Karıştırmak", "Karşılaşmak", "Uygulamak"]),
    Question(question: "Demonstrate", correctAnswer: "Göstermek", options: ["Göstermek", "Saklamak", "Unutmak", "Karıştırmak"]),
    Question(question: "Derive", correctAnswer: "Türetmek", options: ["Türetmek", "Kaybetmek", "Bozmak", "Satmak"]),
    Question(question: "Design", correctAnswer: "Tasarlamak", options: ["Tasarlamak", "Yıkmak", "Durdurmak", "Bozmak"]),
    Question(question: "Detect", correctAnswer: "Tespit etmek", options: ["Tespit etmek", "Unutmak", "Saklamak", "Karıştırmak"]),
    Question(question: "Devote", correctAnswer: "Adamak", options: ["Adamak", "Unutmak", "Saklamak", "Bozmak"]),
    Question(question: "Diminish", correctAnswer: "Azaltmak", options: ["Azaltmak", "Artırmak", "Kapatmak", "Genişletmek"]),
    // Daha fazla soru ekleyebilirsiniz.
]

