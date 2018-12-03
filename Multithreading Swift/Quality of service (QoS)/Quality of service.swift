//
//  Quality of service.swift
//  Multithreading Swift
//
//  Created by Alex on 03.11.18.
//  Copyright © 2018 alex. All rights reserved.
//

import Foundation

// QualityOfService = Якість обслуговування

//.userInteractive - для завдань, які взаємодіють з користувачем в даний момент і займають дуже мало часу: анімація, виконуються миттєво; користувач не хоче цього робити на Main queue , однак це повинно бути зроблено по можливості швидко, так як користувач взаємодіє зі мною прямо зараз. .
//.userInitiated - для завдань, які ініціюються користувачем і вимагають зворотного зв'язку, але це не всередині інтерактивного події, користувач чекає зворотного зв'язку, щоб продовжити взаємодію; може зайняти кілька секунд; має високий пріоритет, але нижче, ніж у попередньої черги,
//.utulity - для завдань, які вимагають деякого часу для виконання і не вимагають негайного зворотного зв'язку, наприклад, завантаження даних або очищення деякої бази даних. Робиться щось, про що користувач не просить, але це необхідно для цього додатка. Завдання може зайняти від декількох секунд до декількох хвилин; пріоритет нижче, ніж у попередньої черги,
//.background - для завдань, не пов'язаних з візуалізацією і не критичних до часу виконання; наприклад, backups або синхронізація з web - сервісом. Це те, що зазвичай запускається у фоновому режимі, відбувається тільки тоді, коли ніхто не хоче ніякого обслуговування. Просто фонова завдання, яка займає чимало часу від хвилин до годин; має найбільш низький пріоритет серед всіх глобальних черг.


struct QualityOfServicePhtread  {
    
    func initiateThread() {
        //створюємо потік
        var thread = pthread_t(bitPattern: 0)
        var attribut = pthread_attr_t()
        pthread_attr_init(&attribut)
        
        //передаємо потоку пріоритет
        pthread_attr_set_qos_class_np(&attribut, QOS_CLASS_USER_INTERACTIVE, 0)
        
        //запускаєм потік
        pthread_create(&thread, &attribut, { (pointer) -> UnsafeMutableRawPointer? in
            print("do something")
            return nil
        }, nil)
    }
}

struct QualityOfServiceNstread  {
    
    func initiateThread() {
        //створюємо потік
        let thread = Thread {
             print("do something")
        }
        thread.qualityOfService = .utility
        thread.start()

    }
}
