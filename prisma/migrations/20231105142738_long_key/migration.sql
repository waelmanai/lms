-- CreateTable
CREATE TABLE `Course` (
    `id` VARCHAR(191) NOT NULL,
    `userId` VARCHAR(191) NOT NULL,
    `title` VARCHAR(255) NOT NULL, -- Reduced the length to 255 characters
    `description` VARCHAR(255) NULL, -- Reduced the length to 255 characters
    `imageUrl` VARCHAR(255) NULL, -- Reduced the length to 255 characters
    `price` DOUBLE NULL,
    `isPublished` BOOLEAN NOT NULL DEFAULT false,
    `categoryId` VARCHAR(191) NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    INDEX `Course_categoryId_idx`(`categoryId`),
    FULLTEXT INDEX `Course_title_idx`(`title`),
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- CreateTable
CREATE TABLE `Category` (
    `id` VARCHAR(191) NOT NULL,
    `name` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `Category_name_key`(`name`),
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- CreateTable
CREATE TABLE `Attachment` (
    `id` VARCHAR(191) NOT NULL,
    `name` VARCHAR(255) NOT NULL, -- Reduced the length to 255 characters
    `url` VARCHAR(255) NOT NULL, -- Reduced the length to 255 characters
    `courseId` VARCHAR(191) NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    INDEX `Attachment_courseId_idx`(`courseId`),
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- CreateTable
CREATE TABLE `Chapter` (
    `id` VARCHAR(191) NOT NULL,
    `title` VARCHAR(255) NOT NULL, -- Reduced the length to 255 characters
    `description` VARCHAR(255) NULL, -- Reduced the length to 255 characters
    `videoUrl` VARCHAR(255) NULL, -- Reduced the length to 255 characters
    `position` INTEGER NOT NULL,
    `isPublished` BOOLEAN NOT NULL DEFAULT false,
    `isFree` BOOLEAN NOT NULL DEFAULT false,
    `courseId` VARCHAR(191) NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    INDEX `Chapter_courseId_idx`(`courseId`),
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- CreateTable
CREATE TABLE `MuxData` (
    `id` VARCHAR(191) NOT NULL,
    `assetId` VARCHAR(255) NOT NULL,
    `playbackId` VARCHAR(255) NULL,
    `chapterId` VARCHAR(255) NOT NULL,

    UNIQUE INDEX `MuxData_chapterId_key`(`chapterId`),
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- CreateTable
CREATE TABLE `UserProgress` (
    `id` VARCHAR(191) NOT NULL,
    `userId` VARCHAR(255) NOT NULL,
    `chapterId` VARCHAR(255) NOT NULL,
    `isCompleted` BOOLEAN NOT NULL DEFAULT false,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    INDEX `UserProgress_chapterId_idx`(`chapterId`),
    UNIQUE INDEX `UserProgress_userId_chapterId_key`(`userId`, `chapterId`),
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- CreateTable
CREATE TABLE `Purchase` (
    `id` VARCHAR(191) NOT NULL,
    `userId` VARCHAR(255) NOT NULL,
    `courseId` VARCHAR(255) NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    INDEX `Purchase_courseId_idx`(`courseId`),
    UNIQUE INDEX `Purchase_userId_courseId_key`(`userId`, `courseId`),
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- CreateTable
CREATE TABLE `StripeCustomer` (
    `id` VARCHAR(191) NOT NULL,
    `userId` VARCHAR(191) NOT NULL,
    `stripeCustomerId` VARCHAR(191) NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    UNIQUE INDEX `StripeCustomer_userId_key`(`userId`),
    UNIQUE INDEX `StripeCustomer_stripeCustomerId_key`(`stripeCustomerId`),
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
