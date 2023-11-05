/*
  Warnings:

  - You are about to alter the column `name` on the `attachment` table. The data in that column could be lost. The data in that column will be cast from `VarChar(255)` to `VarChar(191)`.
  - You are about to alter the column `url` on the `attachment` table. The data in that column could be lost. The data in that column will be cast from `VarChar(255)` to `VarChar(191)`.
  - You are about to alter the column `title` on the `chapter` table. The data in that column could be lost. The data in that column will be cast from `VarChar(255)` to `VarChar(191)`.
  - You are about to alter the column `description` on the `chapter` table. The data in that column could be lost. The data in that column will be cast from `VarChar(255)` to `VarChar(191)`.
  - You are about to alter the column `videoUrl` on the `chapter` table. The data in that column could be lost. The data in that column will be cast from `VarChar(255)` to `VarChar(191)`.
  - You are about to alter the column `title` on the `course` table. The data in that column could be lost. The data in that column will be cast from `VarChar(255)` to `VarChar(191)`.
  - You are about to alter the column `description` on the `course` table. The data in that column could be lost. The data in that column will be cast from `VarChar(255)` to `VarChar(191)`.
  - You are about to alter the column `imageUrl` on the `course` table. The data in that column could be lost. The data in that column will be cast from `VarChar(255)` to `VarChar(191)`.
  - You are about to alter the column `assetId` on the `muxdata` table. The data in that column could be lost. The data in that column will be cast from `VarChar(255)` to `VarChar(191)`.
  - You are about to alter the column `playbackId` on the `muxdata` table. The data in that column could be lost. The data in that column will be cast from `VarChar(255)` to `VarChar(191)`.
  - You are about to alter the column `chapterId` on the `muxdata` table. The data in that column could be lost. The data in that column will be cast from `VarChar(255)` to `VarChar(191)`.
  - You are about to alter the column `userId` on the `purchase` table. The data in that column could be lost. The data in that column will be cast from `VarChar(255)` to `VarChar(191)`.
  - You are about to alter the column `courseId` on the `purchase` table. The data in that column could be lost. The data in that column will be cast from `VarChar(255)` to `VarChar(191)`.
  - You are about to alter the column `userId` on the `userprogress` table. The data in that column could be lost. The data in that column will be cast from `VarChar(255)` to `VarChar(191)`.
  - You are about to alter the column `chapterId` on the `userprogress` table. The data in that column could be lost. The data in that column will be cast from `VarChar(255)` to `VarChar(191)`.

*/
-- DropIndex
DROP INDEX `Course_title_idx` ON `course`;

-- AlterTable
ALTER TABLE `attachment` MODIFY `name` VARCHAR(191) NOT NULL,
    MODIFY `url` VARCHAR(191) NOT NULL;

-- AlterTable
ALTER TABLE `chapter` MODIFY `title` VARCHAR(191) NOT NULL,
    MODIFY `description` VARCHAR(191) NULL,
    MODIFY `videoUrl` VARCHAR(191) NULL;

-- AlterTable
ALTER TABLE `course` MODIFY `title` VARCHAR(191) NOT NULL,
    MODIFY `description` VARCHAR(191) NULL,
    MODIFY `imageUrl` VARCHAR(191) NULL;

-- AlterTable
ALTER TABLE `muxdata` MODIFY `assetId` VARCHAR(191) NOT NULL,
    MODIFY `playbackId` VARCHAR(191) NULL,
    MODIFY `chapterId` VARCHAR(191) NOT NULL;

-- AlterTable
ALTER TABLE `purchase` MODIFY `userId` VARCHAR(191) NOT NULL,
    MODIFY `courseId` VARCHAR(191) NOT NULL;

-- AlterTable
ALTER TABLE `userprogress` MODIFY `userId` VARCHAR(191) NOT NULL,
    MODIFY `chapterId` VARCHAR(191) NOT NULL;

-- CreateIndex
CREATE INDEX `Course_title_idx` ON `Course`(`title`);
